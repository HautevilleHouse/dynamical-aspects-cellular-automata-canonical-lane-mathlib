import DynamicalAspectsCellularAutomataCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse
