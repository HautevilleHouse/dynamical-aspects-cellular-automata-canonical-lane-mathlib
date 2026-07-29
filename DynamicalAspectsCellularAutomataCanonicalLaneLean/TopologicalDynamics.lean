import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure TopologicalDynamics (A : CellularAutomaton) where
  ConfigSpace : Type u
  ShiftMap : ConfigSpace -> ConfigSpace
  Continuous : Prop
  UniformContinuity : Prop
  MixingProperties : Prop

structure TopologicalDynamicsEvidence (A : CellularAutomaton) (T : TopologicalDynamics A) where
  continuousClosed : T.Continuous
  uniformContinuityClosed : T.UniformContinuity
  mixingPropertiesClosed : T.MixingProperties

def TopologicalDynamicsClosed (A : CellularAutomaton) (T : TopologicalDynamics A) : Prop :=
  T.Continuous ∧ T.UniformContinuity ∧ T.MixingProperties

theorem topological_dynamics_closed_from_evidence (A : CellularAutomaton) (T : TopologicalDynamics A) (E : TopologicalDynamicsEvidence A T) :
    TopologicalDynamicsClosed A T := by
  exact And.intro E.continuousClosed (And.intro E.uniformContinuityClosed E.mixingPropertiesClosed)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse