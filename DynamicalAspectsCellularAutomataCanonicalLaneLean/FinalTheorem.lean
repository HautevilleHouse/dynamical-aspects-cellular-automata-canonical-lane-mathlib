import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomatonStateSpace
import DynamicalAspectsCellularAutomataCanonicalLaneLean.EquicontinuityClassification
import DynamicalAspectsCellularAutomataCanonicalLaneLean.TopologicalEntropyClassification

/-!
# Final Theorem: Admissible-Class Closure for Dynamical Aspects of Cellular Automata

This module defines the constrained closure combining equicontinuity and
entropy evidence, and provides the proof that the admissible class closes.
-/

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

def ConstrainedDynamicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamics_endgame (A : AdmissibleClass) :
    ConstrainedDynamicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse